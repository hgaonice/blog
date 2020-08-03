package com.gaoh.entity.manage.book.dto;

import com.gaoh.entity.manage.book.Book;
import com.gaoh.entity.manage.operation.Tag;
import lombok.Data;

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
