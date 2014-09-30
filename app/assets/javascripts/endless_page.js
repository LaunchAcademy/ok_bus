var currentPage = 1 ;

function checkScroll() {
  if (nearBottomOfPage()) {
    currentPage++ ;
    new Ajax.Request('/bus/' + currentPage, {asynchronous: true, evalScripts: true, method: 'get'});
  } else {
    setTimeOut("checkScroll()",250);
  }
}

function nearBottomOfPage(){
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(){
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight(){
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}

document.observe('dom:loaded', checkScroll);
