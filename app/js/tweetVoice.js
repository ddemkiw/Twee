var tweets = document.getElementsByClassName("tweet");
  var worte;
  var tweet;
  for(var i in tweets){
    tweet = tweets[i].innerHTML.replace(/http:\/\/[^\/]+\/[^\s]+/,'');
    worte = new SpeechSynthesisUtterance(tweet);
    worte.lang = "en-UK";
    window.speechSynthesis.speak(worte);
  }