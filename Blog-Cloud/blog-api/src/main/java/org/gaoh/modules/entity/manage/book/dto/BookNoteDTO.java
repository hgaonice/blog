package org.gaoh.modules.entity.manage.book.dto;

import lombok.Data;
import org.gaoh.modules.entity.manage.book.BookNote;
import org.gaoh.modules.entity.manage.operation.Tag;

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
