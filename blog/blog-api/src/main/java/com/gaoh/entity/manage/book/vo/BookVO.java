package com.gaoh.entity.manage.book.vo;

import com.gaoh.entity.manage.book.Book;
import com.gaoh.entity.manage.book.BookNote;
import com.gaoh.entity.manage.book.BookSense;
import com.gaoh.entity.manage.operation.Tag;
import lombok.Data;

import java.util.List;

/**
 * ReadBookVo
 *
 * @author gaoh
 * @date 2020/01/29 14:17
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class BookVO extends Book {

    /**
     * 所属分类，以逗号分隔
     */
    private String categoryListStr;

    /**
     * 所属标签
     */
    private List<Tag> tagList;

    /**
     * 所属笔记
     */
    private List<BookNote> bookNoteList;

    /**
     * 读后感
     */
    private BookSense bookSense;
}
