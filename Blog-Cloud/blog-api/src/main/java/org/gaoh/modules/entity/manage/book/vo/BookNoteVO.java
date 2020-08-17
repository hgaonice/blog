package org.gaoh.modules.entity.manage.book.vo;

import lombok.Data;
import org.gaoh.modules.entity.manage.book.Book;
import org.gaoh.modules.entity.manage.book.BookNote;
import org.gaoh.modules.entity.manage.operation.Tag;

import java.util.List;

/**
 * ArticleVo
 *
 * @author gaoh
 * @date 2020/01/09 16:51
 * @email 2199382542@qq.com
 * @description 文章列表VO
 */
@Data
public class BookNoteVO extends BookNote {

    /**
     * 所属分类，以逗号分隔
     */
    private String categoryListStr;

    /**
     * 所属标签
     */
    private List<Tag> tagList;

    /**
     * 所属书本
     */
    private Book book;

}
