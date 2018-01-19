class ScrapingImdb
  require "nokogiri"
  require "open-uri"
  attr_reader :doc
  URL = "http://www.imdb.com/chart/boxoffice?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=27
    73216402&pf_rd_r=098S840WN6NVGQ6M547H&pf_rd_s=right-7&pf_rd_t=15061&pf_rd_i=homepage&ref_=hm_cht_hd"
  def initialize
    @doc = Nokogiri::HTML(open(URL))
  end

  def title
    doc.css(".titleColumn")
  end
end
