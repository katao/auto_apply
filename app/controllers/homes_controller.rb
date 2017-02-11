class HomesController < ApplicationController
  require 'capybara-webkit'
  Capybara.current_driver = :webkit
  Capybara.javascript_driver = :webkit

  s = Capybara::Session.new(:webkit)
  #s.visit 'http://www.100percent.co.jp/'
  s.visit 'http://www.kani-marumasa.com/pre/'
  #s.save_screenshot 'home.png'
  s.fill_in :sDAT1, with: '片岡信之'
  s.fill_in :sDAT2, with: 'daithi0808@yahoo.co.jp'
  s.fill_in :sDAT3, with: '090-3693-4609'
  s.fill_in :sDAT4, with: '277-0055'
  s.select('千葉県', :from => 'sDAT5')
  s.fill_in :sDAT6, with: '柏市若葉2-4セルフィール柏101号'
  s.click_on('プレゼント応募')
  sleep(2)
  #s.save_screenshot 'comp.png'
end
