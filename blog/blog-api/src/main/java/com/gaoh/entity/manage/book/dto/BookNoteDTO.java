package com.gaoh.entity.manage.book.dto;

import com.gaoh.entity.manage.book.BookNote;
import com.gaoh.entity.manage.operation.Tag;
import lombok.Data;

import java.util.List;

/**
 * BookNote
 *
 * @author gaoh
 * @date 2020/01/08 19:04
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class BookNoteDTO extends BookNote {

    private List<Tag> tagList;

}
