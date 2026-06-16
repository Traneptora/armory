# from https://github.com/jfromaniello/joseoncodecom/raw/master/_plugins/tag_gen.rb
module Jekyll
  class TagIndex < Page
    def initialize(site, base, dir, tag, subtag, subtag_list, title)
      @site = site
      @base = base
      @dir = "../"
      @name = dir + '.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      if subtag != nil
        self.data['tag'] = tag['tag']
        self.data['subtag'] = subtag['tag']
        if title != nil
          self.data['title'] = title
        else
          self.data['title'] = "#{tag['name']}: #{subtag['name']}"
        end
        self.data['parent'] = tag['name']
        self.data['subtags'] = nil
      else
        self.data['tag'] = tag
        self.data['subtag'] = nil
        if title != nil
          self.data['title'] = title
        else
          self.data['title'] = tag.capitalize
        end
        self.data['subtags'] = subtag_list
      end
    end
  end

  class TagGenerator < Generator
    safe true

    def write_tag(site, dir, typez, tag)
      write_tag_index(site, File.join(dir, tag), tag, nil, typez['subtags'], typez['name'])
      if typez['subtags'] != nil
        typez['subtags'].each do |subtypez|
          write_tag_index(site, File.join(dir, "#{typez['tag']}-#{subtypez['tag']}"), typez, subtypez, nil, nil)
        end
      end
    end

    def generate(site)
      if site.layouts.key? 'tag_index'
        dir = site.config['tag_dir'] || 'tags'
        tags_done = []
        site.data['types'].each do |typez|
          write_tag(site, dir, typez, typez['tag'])
          tags_done.push(typez['tag'])
        end
        site.data['properties'].each do |typez|
          write_tag(site, dir, typez, typez['tag'])
          tags_done.push(typez['tag'])
        end
        site.tags.keys.each do |tag|
          if not tags_done.include? tag
            write_tag_index(site, File.join(dir, tag), tag, nil, nil, nil)
          end
        end
      end
    end
    def write_tag_index(site, dir, tag, subtag, subtag_list, title)
      index = TagIndex.new(site, site.source, dir, tag, subtag, subtag_list, title)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end
