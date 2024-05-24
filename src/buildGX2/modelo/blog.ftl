<div class="conteiner">
    <div class="row justify-content-center">
        <#if entries?has_content>
            <#list entries as entry>
                <#assign assetRenderer=entry.getAssetRenderer() />
                <#assign viewURL=assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetRenderer, entry, !stringUtil.equals(assetLinkBehavior, "showFullContent" )) />
                <#assign DDMFormFieldValuesMap=assetRenderer.getDDMFormValuesReader().getDDMFormValues().getDDMFormFieldValuesMap() />
                <#assign DDMFormFieldsReferencesMap=assetRenderer.article.DDMStructure.DDMForm.getDDMFormFieldsReferencesMap(true) />
                <div class="card col-md-3">
                    <div>
                        <#assign imgField=DDMFormFieldsReferencesMap['Image56858550'].name />
                        <#assign imgValue=DDMFormFieldValuesMap[imgField]
                            [0].getValue().getString(locale) />
                        <#assign imgTop=imgValue?eval />
                        <img class="img-fluid w-100" alt="imagem-web" src="${imgTop.url}">
                    </div>
                    <div class="col-12 titulo-noticia">
                        <a href="${viewURL}">
                            <#assign titleField=DDMFormFieldsReferencesMap['Text41815836'].name />
                            <#assign title=DDMFormFieldValuesMap[titleField]
                                [0].getValue().getString(locale) />
                            <h3>
                                ${title}
                            </h3>
                        </a>
                    </div>
                    <span>
                        <#assign dateField=DDMFormFieldsReferencesMap['Date70148589'].name />
                        <#assign dateString=DDMFormFieldValuesMap[dateField]
                            [0].getValue().getString(locale) />
                        <#assign dateObject=dateString?datetime["yyyy-MM-dd"] />
                        ${dateObject?string("dd/MM/yyyy")}
                    </span>
                </div>
            </#list>
        </#if>
    </div>
</div>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jersey+10&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap');

.card {
    background: black;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    margin-bottom: 30px;
    margin-left: 5px;
    min-height: 250px;
    margin-top: 10px;
}

.row {
    margin-left: 0px;
    margin-right: 0px;
}

.titulo-noticia {
    font-family: "Playfair Display", serif;
    font-optical-sizing: auto;
}

.conteudo {
    background: rgbrgb(255, 254, 254);
    padding: 15px;
    overflow: auto;
    height: 250px;
    font-family: "Playfair Display", serif;
    font-optical-sizing: auto;
}
</style>