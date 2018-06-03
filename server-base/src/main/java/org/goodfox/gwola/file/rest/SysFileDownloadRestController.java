package org.goodfox.gwola.file.rest;

import org.goodfox.gwola.file.service.SysFileEOService;
import org.goodfox.gwola.file.store.IFileStore;
import org.goodfox.gwola.sys.entity.SysFileEO;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.Result;
import org.goodfox.gwola.util.utils.cipher.Encodes;
import org.goodfox.gwola.util.utils.IOUtils;
import org.goodfox.gwola.util.utils.StringUtils;
import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@RestController
@RequestMapping(value = "/${restPath}/sys/file")
@Api(description = "系统 - 文件")
public class SysFileDownloadRestController {

    private static final Logger logger = LoggerFactory.getLogger(SysFileDownloadRestController.class);

    @Autowired
    private SysFileEOService sysFileEOService;

    @Autowired
    private IFileStore iFileStore;

    @GetMapping("/{fileId}")
    public ResponseMessage<SysFileEO> getById(@PathVariable("fileId") String fileId) {
        return Result.success(sysFileEOService.get(fileId));
    }

    @GetMapping("/{fileId}/download")
    public void downFile(HttpServletResponse response, @PathVariable("fileId") String fileId, String fileName) {
        if (StringUtils.isEmpty(fileId)) {
            throw new GwolaBaseException("FileId不能为空");
        }

        SysFileEO sysFileEO = sysFileEOService.get(fileId);
        if (sysFileEO == null) {
            throw new GwolaBaseException("FileId[" + fileId + "]不存在");
        }

        InputStream is = null;
        OutputStream os = null;
        try {
            if (StringUtils.isEmpty(fileName)) {
                fileName = sysFileEO.getFileName();
            }

            response.setHeader("Content-Disposition", "attachment; filename=" + Encodes.urlEncode(fileName + "." + sysFileEO.getFileType()));
            response.setContentType(sysFileEO.getContentType());
            is = iFileStore.loadFile(sysFileEO.getSavePath());
            os = response.getOutputStream();
            IOUtils.copy(is, os);
            os.flush();
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
            throw new GwolaBaseException("下载文件失败，请重试");
        } finally {
            IOUtils.closeQuietly(is);
            IOUtils.closeQuietly(os);
        }
    }

}
