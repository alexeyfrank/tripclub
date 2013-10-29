(function(){function l(g,d,a){var c;return c=g.getWrapperElement().appendChild(document.createElement("div")),c.className=a?"CodeMirror-dialog CodeMirror-dialog-bottom":"CodeMirror-dialog CodeMirror-dialog-top",c.innerHTML=d,c}CodeMirror.defineExtension("openDialog",function(g,d,a){function c(){k||(k=!0,f.parentNode.removeChild(f))}var f=l(this,g,a&&a.bottom),k=!1,i=this,e=f.getElementsByTagName("input")[0];if(e)CodeMirror.on(e,"keydown",function(a){(13==a.keyCode||27==a.keyCode)&&(CodeMirror.e_stop(a),
c(),i.focus(),13==a.keyCode&&d(e.value))}),a&&a.value&&(e.value=a.value),e.focus(),CodeMirror.on(e,"blur",c);else if(g=f.getElementsByTagName("button")[0])CodeMirror.on(g,"click",function(){c();i.focus()}),g.focus(),CodeMirror.on(g,"blur",c);return c});CodeMirror.defineExtension("openConfirm",function(g,d,a){function c(){k||(k=!0,f.parentNode.removeChild(f),i.focus())}var f=l(this,g,a&&a.bottom),g=f.getElementsByTagName("button"),k=!1,i=this,e=1,j;g[0].focus();for(a=0;a<g.length;++a)j=g[a],function(a){CodeMirror.on(j,
"click",function(d){CodeMirror.e_preventDefault(d);c();a&&a(i)})}(d[a]),CodeMirror.on(j,"blur",function(){--e;setTimeout(function(){0>=e&&c()},200)}),CodeMirror.on(j,"focus",function(){++e})})})();
(function(){function l(h){return"string"==typeof h?{token:function(a){if(a.match(h))return"searching";a.next();a.skipTo(h.charAt(0))||a.skipToEnd()}}:{token:function(a){if(a.match(h))return"searching";for(;!a.eol()&&!(a.next(),a.match(h,!1)););}}}function g(){this.overlay=this.posFrom=this.posTo=this.query=null}function d(h,a,d){return h.getSearchCursor(a,d,"string"==typeof a&&a==a.toLowerCase())}function a(a,d,e,g){a.openDialog?a.openDialog(d,g):g(prompt(e,""))}function c(a,d,e,g){a.openConfirm?
a.openConfirm(d,g):confirm(e)&&g[0]()}function f(a){var d=a.match(/^\/(.*)\/([a-z]*)$/);return d?RegExp(d[1],-1==d[2].indexOf("i")?"":"i"):a}function k(h,d){var e=h._searchState||(h._searchState=new g);if(e.query)return i(h,d);a(h,q,"Search for:",function(a){h.operation(function(){a&&!e.query&&(e.query=f(a),h.removeOverlay(e.overlay),e.overlay=l(a),h.addOverlay(e.overlay),e.posFrom=e.posTo=h.getCursor(),i(h,d))})})}function i(a,e){a.operation(function(){var b=a._searchState||(a._searchState=new g),
c=d(a,b.query,e?b.posFrom:b.posTo);(c.find(e)||(c=d(a,b.query,e?CodeMirror.Pos(a.lastLine()):CodeMirror.Pos(a.firstLine(),0)),c.find(e)))&&(a.setSelection(c.from(),c.to()),b.posFrom=c.from(),b.posTo=c.to())})}function e(a){a.operation(function(){var e=a._searchState||(a._searchState=new g);e.query&&(e.query=null,a.removeOverlay(e.overlay))})}function j(h,g){a(h,r,"Replace:",function(j){j&&(j=f(j),a(h,b,"Replace with:",function(a){if(g)h.operation(function(){for(var e,b=d(h,j);b.findNext();)"string"!=
typeof j?(e=h.getRange(b.from(),b.to()).match(j),b.replace(a.replace(/\$(\d)/,function(a,b){return e[b]}))):b.replace(a)});else{e(h);var b=d(h,j,h.getCursor()),f=function(){var a=b.from(),e;((e=b.findNext())||(b=d(h,j),(e=b.findNext())&&(!a||b.from().line!=a.line||b.from().ch!=a.ch)))&&(h.setSelection(b.from(),b.to()),c(h,m,"Replace?",[function(){i(e)},f]))},i=function(e){b.replace("string"==typeof j?a:a.replace(/\$(\d)/,function(a,b){return e[b]}));f()};f()}}))})}var q='Search: <input type="text" style="width: 10em"/> <span style="color: #888">(Use /re/ syntax for regexp search)</span>',
r='Replace: <input type="text" style="width: 10em"/> <span style="color: #888">(Use /re/ syntax for regexp search)</span>',b='With: <input type="text" style="width: 10em"/>',m="Replace? <button>Yes</button> <button>No</button> <button>Stop</button>";CodeMirror.commands.find=function(a){e(a);k(a)};CodeMirror.commands.findNext=k;CodeMirror.commands.findPrev=function(a){k(a,!0)};CodeMirror.commands.clearSearch=e;CodeMirror.commands.replace=j;CodeMirror.commands.replaceAll=function(a){j(a,!0)}})();
(function(){function l(d,a,c,f){if(this.atOccurrence=!1,this.cm=d,null==f&&"string"==typeof a&&(f=!1),c=c?d.clipPos(c):g(0,0),this.pos={from:c,to:c},"string"!=typeof a)a.global||(a=RegExp(a.source,a.ignoreCase?"ig":"g")),this.matches=function(e,j){var c;if(e){a.lastIndex=0;for(var f=d.getLine(j.line).slice(0,j.ch),b=a.exec(f),i=0;b;)if(i+=b.index+1,f=f.slice(i),a.lastIndex=0,c=a.exec(f),c)b=c;else break;i--}else a.lastIndex=j.ch,f=d.getLine(j.line),i=(b=a.exec(f))&&b.index;if(b&&b[0])return{from:g(j.line,
i),to:g(j.line,i+b[0].length),match:b}};else{f&&(a=a.toLowerCase());var k=f?function(a){return a.toLowerCase()}:function(a){return a},i=a.split("\n");this.matches=1==i.length?a.length?function(e,c){var f=k(d.getLine(c.line)),i=a.length,b;if(e?c.ch>=i&&-1!=(b=f.lastIndexOf(a,c.ch-i)):-1!=(b=f.indexOf(a,c.ch)))return{from:g(c.line,b),to:g(c.line,b+i)}}:function(){}:function(a,c){var f=c.line,l=a?i.length-1:0,b=i[l],m=k(d.getLine(f)),h=a?m.indexOf(b)+b.length:m.lastIndexOf(b),n,o,p;if(!(a?h>=c.ch||h!=
b.length:h<=c.ch||h!=m.length-b.length))for(;!(a?!f:f==d.lineCount()-1);)if(m=k(d.getLine(f+=a?-1:1)),b=i[a?--l:++l],0<l&&l<i.length-1){if(m!=b)break}else return(n=a?m.lastIndexOf(b):m.indexOf(b)+b.length,a?n!=m.length-b.length:n!=b.length)?void 0:(o=g(c.line,h),p=g(f,n),{from:a?p:o,to:a?o:p})}}}var g=CodeMirror.Pos;l.prototype={findNext:function(){return this.find(!1)},findPrevious:function(){return this.find(!0)},find:function(d){function a(a){a=g(a,0);return c.pos={from:a,to:a},c.atOccurrence=
!1,!1}for(var c=this,f=this.cm.clipPos(d?this.pos.from:this.pos.to),k;;){if(this.pos=this.matches(d,f))return this.pos.from&&this.pos.to||console.log(this.matches,this.pos),this.atOccurrence=!0,this.pos.match||!0;if(d){if(!f.line)return a(0);f=g(f.line-1,this.cm.getLine(f.line-1).length)}else{if(k=this.cm.lineCount(),f.line==k-1)return a(k);f=g(f.line+1,0)}}},from:function(){if(this.atOccurrence)return this.pos.from},to:function(){if(this.atOccurrence)return this.pos.to},replace:function(d){this.atOccurrence&&
(d=CodeMirror.splitLines(d),this.cm.replaceRange(d,this.pos.from,this.pos.to),this.pos.to=g(this.pos.from.line+d.length-1,d[d.length-1].length+(1==d.length?this.pos.from.ch:0)))}};CodeMirror.defineExtension("getSearchCursor",function(d,a,c){return new l(this,d,a,c)})})();
