"use strict"

headerContext =
    title :'webapp-handlebars-ajax'

marketingContext =
    items: [
        {
            title: 'HTML5 Boilerplate',
            body: 'HTML5 Boilerplate is a professional front-end template for building fast, robust, and adaptable web apps or sites.'
        },
        {
            title: 'Sass',
            body: 'Sass is a mature, stable, and powerful professional grade CSS extension language.'
        },
        {
            title: 'Bootstrap',
            body: 'Sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development.'
        },
        {
            title: 'Modernizr',
            body: 'Modernizr is an open-source JavaScript library that helps you build the next generation of HTML5 and CSS3-powered websites.'
        }
    ]

headerFragment = new Template('header').set(headerContext)
jumbotronFragment = new Template('jumbotron').set()
marketingFragment = new Template('marketing').set(marketingContext)

document.querySelector('div.header').innerHTML = headerFragment
document.querySelector('div.jumbotron').innerHTML = jumbotronFragment
document.querySelector('div.marketing').innerHTML = marketingFragment
