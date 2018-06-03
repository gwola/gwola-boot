package org.goodfox.gwola.file.service;

import org.goodfox.gwola.file.dao.SysFileEODao;
import org.goodfox.gwola.file.store.IFileStore;
import org.goodfox.gwola.sys.entity.SysFileEO;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.service.CrudService;
import org.goodfox.gwola.util.utils.FileUtil;
import org.goodfox.gwola.util.utils.UUID;
import org.goodfox.gwola.file.dao.SysFileEODao;
import org.goodfox.gwola.util.utils.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

@Service
public class SysFileEOService extends CrudService<SysFileEODao, SysFileEO, String> {

    @Autowired
    private IFileStore iFileStore;

    public SysFileEO saveSysFile(String userId, InputStream is, String fileName, String contentType) {
        SysFileEO sysFileEO;
        try {
            String fileExtension = FileUtil.getFileExtension(fileName);

            String path = iFileStore.storeFile(is, fileExtension);

            sysFileEO = new SysFileEO();
            sysFileEO.setFileId(UUID.randomUUID());
            sysFileEO.setFileName(FileUtil.getFileName(fileName));
            sysFileEO.setFileType(fileExtension);
            sysFileEO.setContentType(contentType);
            sysFileEO.setSavePath(path);
            sysFileEO.setCreateTime(new Date());
            sysFileEO.setUserId(userId);
            save(sysFileEO);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
            throw new GwolaBaseException("文件存储失败，请重试");
        }
        return sysFileEO;
    }

    public InputStream loadFile(String fileId) {
        SysFileEO sysFileEO = this.get(fileId);
        if (sysFileEO == null) {
            throw new GwolaBaseException("FileId[" + fileId + "]不存在");
        }
        return iFileStore.loadFile(sysFileEO.getSavePath());
    }
}
