desc "This task is called by the Heroku scheduler add-on. See https://blog.heroku.com/heroku_scheduler_add_on_now_available"
task :update_stock_price => :environment do
    puts "Updating stock price..."
    CrawlStockDataService.new.start_crawling
    puts "done."
end