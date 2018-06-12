package io.gwola.boot.base.service;

import io.gwola.boot.base.entity.GwolaTreeEntity;

import java.io.Serializable;

public abstract class GwolaTreeEntityService<E extends GwolaTreeEntity, ID extends Serializable> implements GwolaBaseService<E,ID> {


//    public E organizeListAsTree(T menu, List<T> menuList) {
//        return new TreeEntityUtil<T>().organizeListAsTree(menu, menuList);
//    }


//    public abstract T getTopEntity();
//
//    public TreeEntity listAsTree() {
//        TreeEntity treeEntity = organizeListAsTree(getTopEntity(), findAll());
//        return treeEntity;
//    }
}
