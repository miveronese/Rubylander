(function(){var k,l,o=[].indexOf||function(e){for(var a=0,d=this.length;a<d;a++)if(a in this&&this[a]===e)return a;return-1};self.JSREPLEngine=function(){function e(a,d,f,b,g,c){var h=this;this.result=f;this.error=b;this.Ruby=g.Ruby;g.print=function(){};this.error_buffer=[];this.Ruby.initialize(null,function(a){if(a!=null)return d(String.fromCharCode(a))},function(a){if(a!=null)return h.error_buffer.push(String.fromCharCode(a))});c()}e.prototype.Eval=function(a){var d;this.error_buffer=[];try{return d=
this.Ruby.eval(a),this.result(this.Ruby.stringify(d))}catch(f){return typeof f!=="number"?this.error("Internal error: "+f):this.error_buffer.length?this.error(this.error_buffer.join("")):this.error("Unknown error.")}};e.prototype.RawEval=function(a){return this.Eval(a)};e.prototype.GetNextLineIndent=function(a){var d,f,b,g,c,h,e,m,n,i,j;b=f=d=h=g=0;i=a.split("\n");for(a=0,m=i.length;a<m;a++){c=i[a];b=0;j=c.match(l)||[];for(e=0,n=j.length;e<n;e++)if(c=j[e],o.call(k,c)>=0?(g++,b++):c==="("?(h++,b++):
c==="{"?(d++,b++):c==="["?(f++,b++):c==="end"?(g--,b--):c===")"?(h--,b--):c==="]"?(d--,b--):c==="}"&&(f--,b--),g<0||h<0||d<0||f<0)return false}return g>0||h>0||d>0||f>0?b>0?1:0:false};return e}();k="begin,module,def,class,if,unless,case,for,while,until,do".split(",");l=/\s+|\d+(?:\.\d*)?|"(?:[^"]|\\.)*"|'(?:[^']|\\.)*'|\/(?:[^\/]|\\.)*\/|[-+\/*]|[<>=]=?|:?[a-z@$][\w?!]*|[{}()\[\]]|[^\w\s]+/ig}).call(this);
