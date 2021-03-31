<#include "/include/table/properties.ftl">
package ${modulePackage}.model.request;

import ${modulePackage}.model.BaseEntity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import javax.validation.constraints.*;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ApiModel(description = "${tableComment}保存请求实体")
@Getter
@Setter
@ToString
public class ${className}SaveRequest extends BaseEntity {
    <#assign columnIndex = 0>
    <#list table.columnsExceptBase as column>
    <#include "/include/column/properties.ftl">
    <#assign columnIndex = columnIndex+1>

    @ApiModelProperty(value = "${columnFullComment}", position = ${columnIndex}<#if (column.pk && column.autoIncrement)>, required = true</#if>)
    <#if (column.pk && column.autoIncrement)>
    @NotNull(message = "${fieldName}(${columnComment})不能为空")
    </#if>
    private ${fieldType} ${fieldName};
    </#list>
}
