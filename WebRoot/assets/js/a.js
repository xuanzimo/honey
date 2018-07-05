window.onload = function() {
            var list = document.getElementById('list');var prev = document.getElementById('prev');
            var next = document.getElementById('next');

            function animate(offset) {
                var newLeft = parseInt(list.style.left) + offset;
                list.style.left = newLeft + 'px';
                
                if(newLeft<-3000){
                    list.style.left = -600 + 'px';
               }
               if(newLeft>-600){
                    list.style.left = -3000 + 'px';
               }
            }

            prev.onclick = function() {             
                animate(600);
            };
            next.onclick = function() {  
                animate(-600);
            };
        };
var timer;
function play() {
    timer = setInterval(function () {
        prev.onclick();
    }, 10000);
}
play();