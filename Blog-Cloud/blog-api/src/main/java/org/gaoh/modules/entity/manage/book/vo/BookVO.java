package org.gaoh.modules.entity.manage.book.vo;

import lombok.Data;
import org.gaoh.modules.entity.manage.book.Book;
import org.gaoh.modules.entity.manage.book.BookNote;
import org.gaoh.modules.entity.manage.book.BookSense;
import org.gaoh.modules.entity.manage.operation.Tag;

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
