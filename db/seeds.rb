# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Studio.destroy_all
Studio.create(name: "Williamsburg", link: "https://www.soul-cycle.com/find-a-class/studio/22/", image: "BURG.png")
Studio.create(name: "West Village", link: "https://www.soul-cycle.com/find-a-class/studio/20/", image: "WVLG.png")
Studio.create(name: "West 27th Street", link: "https://www.soul-cycle.com/find-a-class/studio/1022/", image: "W27.png")
Studio.create(name: "East 83rd Street", link: "https://www.soul-cycle.com/find-a-class/studio/3/", image: "E83.png")
Studio.create(name: "NoHo", link: "https://www.soul-cycle.com/find-a-class/studio/19/", image: "NOHO.png")
Studio.create(name: "West 92nd Street", link: "https://www.soul-cycle.com/find-a-class/studio/1029/", image: "W92.png")
Studio.create(name: "East 63rd Street", link: "https://www.soul-cycle.com/find-a-class/studio/213/", image: "E63.png")
Studio.create(name: "Financial District", link: "https://www.soul-cycle.com/find-a-class/studio/1018/", image: "FIDI.png")
Studio.create(name: "SoHo", link: "https://www.soul-cycle.com/find-a-class/studio/21/", image: "SOHO.png")
Studio.create(name: "19th Street", link: "https://www.soul-cycle.com/find-a-class/studio/30/", image: "19TH.png")
Studio.create(name: "Brooklyn Heights", link: "https://www.soul-cycle.com/find-a-class/studio/1027/", image: "BKHT.png")
Studio.create(name: "West 77th Street", link: "https://www.soul-cycle.com/find-a-class/studio/1/", image: "W77.png")
Studio.create(name: "Bryant Park", link: "https://www.soul-cycle.com/find-a-class/studio/1034/", image: "BRPK.png")
Studio.create(name: "Chelsea", link: "https://www.soul-cycle.com/find-a-class/studio/1042/", image: "CHLS.png")
Studio.create(name: "Union Square", link: "https://www.soul-cycle.com/find-a-class/studio/9/", image: "UNSQ.png")
Studio.create(name: "East 54th Street", link: "https://www.soul-cycle.com/find-a-class/studio/1036/", image: "E54.png")
Studio.create(name: "TriBeCa", link: "https://www.soul-cycle.com/find-a-class/studio/4/", image: "TRI.png")
