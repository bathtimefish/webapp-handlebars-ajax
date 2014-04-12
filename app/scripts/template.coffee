'use strict'
class Template
    _Handlebars: null
    _template: null
    constructor: (name)->
        @_Handlebars = window.Handlebars
        if name?
            @_getTemplateAsync(name)
            .then((data)=>  # double arrow
                # console.warn data
                @_template = @_Handlebars.compile(data)
            )
            .fail((data)=>  # double arrow
                console.error data
            )
        else
            throw "TemplateNameNotFoundException"
    set: (context)->
        @_template(context)
    _getTemplateAsync: (name)->
        d = $.Deferred()
        successCb = (data)->
            d.resolve(data)
        errorCb = (data)->
            d.reject(data)
        options =
            url : 'templates/' + name + '.html'
            datatype: 'text/javascript'
            success : successCb
            async : false
        $.ajax(options).success(successCb).error(errorCb)
        d.promise()

window.Template = Template

### Usage.
context =
    items: [
        {body: "apple"},
        {body: "orange"},
        {body: "mango"},
    ]
document.getElementById('template').innerHTML = new Template('sample').set(context)
###
