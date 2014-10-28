# Prawn-Rails

## Dependencies
 
* prawn > 0.0.12
* Rails 3.0x
* Ruby > 1.8.7

## Install
1.Add to the Rails Gemfile

	gem 'prawn'
	
	gem 'prawn-rails'
		
to the Rails Gemfile


## Usage
Create a view with `pdf` as format and `prawn` as handler 
eg. template name `example.pdf.prawn` 
  
we provide a helper called `prawn_document` 
it build a Prawn::Document with default options. Can override with `page_size` and `page_layout` 
eg. contents of `example.pdf.prawn` 

    prawn_document(:page_layout => :landscape) do |pdf|
      pdf.text "Hello World"
    end

No need to call `pdf.render`, it is called by `prawn_document` 

You can use all prawn document methods like `pdf.text` `pdf.font_size` and also
block like `pdf.font(FONT_NAME,opts) do
pdf.XXXX
end`

For more documentation go to [the manual](http://prawn.majesticseacreature.com/manual.pdf)

### Build in helpers
* *html_strip(html)*
Removes the html tags from a string	 

### Default configuration

Add a `prawn-rails.rb` config to your Rails app under `config/initializers` like this

    PrawnRails.config do |config|
      config.page_layout = :landscape
      config.page_size   = "A4"
    end

by default page_layout is portrait and page_size is "A4"  

## Examples
 
1. **Hello World**
 
	**hello.pdf.prawn**
	
		pdf.start_new_page :size => "A4"
		pdf.text hello world
  
2. ** Using Active Record **

	**myproducts.pdf.prawn**

		pdf.text "Current Products are"
		pdf.move_down 20
		pdf.table(@products.collect{ |p| [p.name,p.price]})


## ToDos

1. Add Default Configuration
2. Add per-render Configuration
3. Simple Html to PDF ?
4. Any Other requested


## Dev Notes
Gem works with any rails 3.0 version and ruby but for development It should be atlest Rails 3.1 (for the testing env)
I'll try to fix that 