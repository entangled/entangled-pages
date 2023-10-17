function CodeBlock(elem)
    if elem.classes[1] ~= "markdown" or elem.classes[2] ~= "bootstrap-card-deck" then
        return
    end
    content = pandoc.read(elem.text)
    print(content.meta.link)
    for _, cls in ipairs({"btn", "btn-secondary", "mt-auto", "mx-4"}) do
        table.insert(content.meta.link[1].classes, cls)
    end
    card = pandoc.Div({
        pandoc.Div({
            pandoc.Div({
                pandoc.Image(content.meta.title, pandoc.utils.stringify(content.meta.image), pandoc.utils.stringify(content.meta.title), {width="100%"})
            }, {class="col-4"}),
            pandoc.Div({
                pandoc.Div({
                    pandoc.Header(3, content.meta.title, {class="card-title"}),
                    pandoc.Div(content.blocks, {class="card-text"}),
                    content.meta.link
                }, {class="card-body"})
            }, {class="col-8"})
        }, {class="row no-gutters"})
    }, {class="card rounded-1g"})
    return pandoc.Div({pandoc.Div({card}, {class="card-deck"})}, {class="container-fluid my-4"})
end
