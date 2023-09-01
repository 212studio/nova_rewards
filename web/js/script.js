const app = new Vue({
    el: '#app',

    data: {
        labelItem : "",
        itemName : "",
        quantity : 0,
        time : "",
        img : ""
    },

    methods: {
        msToMin() {
            var time = this.time
            var minutes = Math.floor(time / 60000);
            var seconds = ((time % 60000) / 1000).toFixed(0);
            return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
        }
    }

});


window.addEventListener('message', function(event) {
    var data = event.data;
    if (data.type === "SET_RICOMPENSA") {
        app.labelItem = data.labelItem;
        app.itemName = data.itemName;
        app.time = data.time;
        app.img = data.img;
        app.quantity = data.quantity;
    } else if(data.type === "SET_TIME") {
        app.time = data.time;
    }
})

