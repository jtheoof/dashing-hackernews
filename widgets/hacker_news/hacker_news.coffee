class Dashing.HackerNews extends Dashing.Widget

  ready: ->
    @currentIndex = 0
    @$news = $(@node).find('.container')
    @nextNews()
    @startCarousel()

  onData: (data) ->
    @currentIndex = 0

  startCarousel: ->
    setInterval(@nextNews, 10000)

  nextNews: =>
    entries = @get('entries')
    if entries
      @$news.fadeOut(300, =>
        @currentIndex = (@currentIndex + 1) % entries.length
        @set 'entry', entries[@currentIndex]
        @$news.fadeIn(300))
