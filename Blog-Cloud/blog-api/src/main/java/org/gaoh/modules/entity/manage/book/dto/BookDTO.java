package org.gaoh.modules.entity.manage.book.dto;

import lombok.Data;
import org.gaoh.modules.entity.manage.book.Book;
import org.gaoh.modules.entity.manage.operation.Tag;

import java.util.List;

/**
 * ReadBookDto
 *
 * @author gaoh
 * @date 2020/01/28 16:44
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class BookDTO extends Book {

    List<Tag> tagList;
}
