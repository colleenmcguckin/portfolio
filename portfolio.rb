# ./portfolio.rb

class Portfolio < Roda
  plugin :static, ["/images", "/css", "/js"]
  plugin :render
  plugin :head
  plugin :assets, css: 'style.css'
  plugin :static, ['/images'], root: 'assets'
  plugin :render

  route do |r|
    r.assets
    r.root do
      @active = 'about'
      view("about")
    end
    r.get 'experience' do
      @active = 'experience'
      view("experience")
    end
    r.get 'work' do
      @active = 'work'
      view("work")
    end
  end
end
