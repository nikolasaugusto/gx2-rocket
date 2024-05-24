<div class="conteiner">
    <div class="row">
        <div class="col-12">
            <#if (Image56858550.getData())?? && Image56858550.getData() !="">
                <img alt="${Image56858550.getAttribute("alt")}" data-fileentryid="${Image56858550.getAttribute("fileEntryId")}" src="${Image56858550.getData()}" />
            </#if>
        </div>
        <div>
            <#if (Text41815836.getData())??>
                <h1>
                    ${Text41815836.getData()}
                </h1>
            </#if>
        </div>
        <div>
            <#if (RichText16448651.getData())??>
                ${RichText16448651.getData()}
            </#if>
        </div>
        <div class="col-6">
            <#assign Date70148589_Data=getterUtil.getString(Date70148589.getData())>
                <#if validator.isNotNull(Date70148589_Data)>
                    <#assign Date70148589_DateObj=dateUtil.parseDate("yyyy-MM-dd", Date70148589_Data, locale)>
                        Publicado em: ${dateUtil.getDate(Date70148589_DateObj, "dd MMM yyyy", locale)}
                </#if>
        </div>
        <div class="col-6">
            <#if (Radio81088925.getData())??>
                Tema: ${Radio81088925.getData()}
            </#if>
        </div>
    </div>
</div>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jersey+10&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap');

.conteiner {
    font-family: "Playfair Display", serif;
    font-optical-sizing: auto;
}
</style>