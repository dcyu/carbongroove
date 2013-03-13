Raphael.fn.drawGrid = function (x, y, w, h, wv, hv, color) {
    color = color || "#000";
    var path = ["M", Math.round(x) + .5, Math.round(y) + .5, "L", Math.round(x + w) + .5, Math.round(y) + .5, Math.round(x + w) + .5, Math.round(y + h) + .5, Math.round(x) + .5, Math.round(y + h) + .5, Math.round(x) + .5, Math.round(y) + .5],
        rowHeight = h / hv,
        columnWidth = w / wv;
    for (var i = 1; i < hv; i++) {
        path = path.concat(["M", Math.round(x) + .5, Math.round(y + i * rowHeight) + .5, "H", Math.round(x + w) + .5]);
    }
    for (i = 1; i < wv; i++) {
        path = path.concat(["M", Math.round(x + i * columnWidth) + .5, Math.round(y) + .5, "V", Math.round(y + h) + .5]);
    }
    return this.path(path.join(",")).attr({stroke: color});
};

$(function () {
    $("#data").css({
        position: "absolute",
        left: "-9999em",
        top: "-9999em"
    });
});

window.onload = function () {
    // var paper = new Raphael(document.getElementById('facebook'), 200, 35);  
    // var facebook = paper.path("M25.566,2.433H6.433c-2.2,0-4,1.8-4,4v19.135c0,2.199,1.8,4,4,4h19.135c2.199,0,4-1.801,4-4V6.433C29.566,4.232,27.768,2.433,25.566,2.433zM25.309,16.916h-3.218v11.65h-4.819v-11.65h-2.409V12.9h2.409v-2.411c0-3.275,1.359-5.224,5.229-5.224h3.218v4.016h-2.011c-1.504,0-1.604,0.562-1.604,1.608L22.091,12.9h3.644L25.309,16.916z")
    // .attr({fill: "#333", stroke: "none"});  

    // var paper2 = new Raphael(document.getElementById('twitter'), 200, 35);  
    // var twitter = paper2.path("M26.492,9.493c-0.771,0.343-1.602,0.574-2.473,0.678c0.89-0.533,1.562-1.376,1.893-2.382c-0.832,0.493-1.753,0.852-2.734,1.044c-0.785-0.837-1.902-1.359-3.142-1.359c-2.377,0-4.306,1.928-4.306,4.306c0,0.337,0.039,0.666,0.112,0.979c-3.578-0.18-6.75-1.894-8.874-4.499c-0.371,0.636-0.583,1.375-0.583,2.165c0,1.494,0.76,2.812,1.915,3.583c-0.706-0.022-1.37-0.216-1.95-0.538c0,0.018,0,0.036,0,0.053c0,2.086,1.484,3.829,3.454,4.222c-0.361,0.099-0.741,0.147-1.134,0.147c-0.278,0-0.547-0.023-0.81-0.076c0.548,1.711,2.138,2.955,4.022,2.99c-1.474,1.146-3.33,1.842-5.347,1.842c-0.348,0-0.69-0.021-1.027-0.062c1.905,1.225,4.168,1.938,6.6,1.938c7.919,0,12.248-6.562,12.248-12.25c0-0.187-0.002-0.372-0.01-0.557C25.186,11.115,25.915,10.356,26.492,9.493")
    // .attr({fill: "#333", stroke: "none"});  



    Raphael.fn.Arc = function (x, y, r, value) {

        var set = this.set();
        var pi = Math.PI;
        var cos = Math.cos;
        var sin = Math.sin;
        var maxValue = 10;
        var t = (pi/2) * 3; 
        var rad = (pi*2 * (value)) / maxValue + t;
        var colors = ["#877e6d","#eb8017", "#766e5f"];
        set.push(this.circle(x, y, r).attr({ fill : colors[+!value], stroke : 0 }));

      var p = [
        "M", x, y,
        "l", r * cos(t), r * sin(t),
        "A", r, r, 0, +(rad > pi + t), 1, x + r * cos(rad), y + r * sin(rad), 
        "z"
      ];

        set.push(this.path(p).attr({ fill : colors[1], stroke : 0 }));
        set.push(this.circle(x, y, r*0.7).attr({ fill : colors[2], stroke : 0 }));

        return set;
        };

        var value = 2.0 // this is place what goal value should be linked
        var canvas = Raphael("arc", 200, 150);
        var arc = canvas.Arc(100,80, 70, value);





    function getAnchors(p1x, p1y, p2x, p2y, p3x, p3y) {
        var l1 = (p2x - p1x) / 2,
            l2 = (p3x - p2x) / 2,
            a = Math.atan((p2x - p1x) / Math.abs(p2y - p1y)),
            b = Math.atan((p3x - p2x) / Math.abs(p2y - p3y));
        a = p1y < p2y ? Math.PI - a : a;
        b = p3y < p2y ? Math.PI - b : b;
        var alpha = Math.PI / 2 - ((a + b) % (Math.PI * 2)) / 2,
            dx1 = l1 * Math.sin(alpha + a),
            dy1 = l1 * Math.cos(alpha + a),
            dx2 = l2 * Math.sin(alpha + b),
            dy2 = l2 * Math.cos(alpha + b);
        return {
            x1: p2x - dx1,
            y1: p2y + dy1,
            x2: p2x + dx2,
            y2: p2y + dy2
        };
    }
    // Grab the data
    var labels = [],
        data = [];
    $("#data tfoot th").each(function () {
        labels.push($(this).html());
    });
    $("#data tbody td").each(function () {
        data.push($(this).html());
    });
    
    // Draw
    var width = 700,
        height = 250,
        leftgutter = 20,
        bottomgutter = 20,
        topgutter = 20,
        colorhue = .6 || Math.random(),
        color = "#dcbd50",
        //  #dcbd50color = "hsl(" + [colorhue, .9, .9] + ")",
        r = Raphael("holder", width, height),
        txt = {font: '12px Helvetica, Arial', fill: "#fff"},
        txt1 = {font: '10px Helvetica, Arial', fill: "#333"},
        txt2 = {font: '12px Helvetica, Arial', fill: "#333"},
        X = (width - leftgutter) / labels.length,
        max = Math.max.apply(Math, data),
        Y = (height - bottomgutter - topgutter) / max;
    r.drawGrid(leftgutter + X * .5 + .5, topgutter + .5, width - leftgutter - X, height - topgutter - bottomgutter, 1, 4, "#a8916c");
    var path = r.path().attr({stroke: color, "stroke-width": 2, "stroke-linejoin": "round"}),
        bgp = r.path().attr({stroke: "none", opacity: .6, fill: color}),
        label = r.set(),
        lx = 0, ly = 0,
        is_label_visible = false,
        leave_timer,
        blanket = r.set();
    label.push(r.text(60, 12, "24 hits").attr(txt));
    label.push(r.text(60, 27, "22 September 2008").attr(txt1).attr({fill: color}));
    label.hide();
    var frame = r.popup(100, 100, label, "right").attr({fill: "#000", stroke: "#333", "stroke-width": 1, "fill-opacity": 1}).hide();

    var p, bgpp;
    for (var i = 0, ii = labels.length; i < ii; i++) {
        var y = Math.round(height - bottomgutter - Y * data[i]),
            x = Math.round(leftgutter + X * (i + .5)),
            t = r.text(x, height - 6, labels[i]).attr(txt).toBack();
        if (!i) {
            p = ["M", x, y, "C", x, y];
            bgpp = ["M", leftgutter + X * .5, height - bottomgutter, "L", x, y, "C", x, y];
        }
        if (i && i < ii - 1) {
            var Y0 = Math.round(height - bottomgutter - Y * data[i - 1]),
                X0 = Math.round(leftgutter + X * (i - .5)),
                Y2 = Math.round(height - bottomgutter - Y * data[i + 1]),
                X2 = Math.round(leftgutter + X * (i + 1.5));
            var a = getAnchors(X0, Y0, x, y, X2, Y2);
            p = p.concat([a.x1, a.y1, x, y, a.x2, a.y2]);
            bgpp = bgpp.concat([a.x1, a.y1, x, y, a.x2, a.y2]);
        }
        var dot = r.circle(x, y, 4).attr({fill: "#433822", stroke: color, "stroke-width": 1});
        blanket.push(r.rect(leftgutter + X * i, 0, X, height - bottomgutter).attr({stroke: "none", fill: "#fff", opacity: 0}));
        var rect = blanket[blanket.length - 1];
        (function (x, y, data, lbl, dot) {
            var timer, i = 0;
            rect.hover(function () {
                clearTimeout(leave_timer);
                var side = "right";
                if (x + frame.getBBox().width > width) {
                    side = "left";
                }
                var ppp = r.popup(x, y, label, side, 1),
                    anim = Raphael.animation({
                        path: ppp.path,
                        transform: ["t", ppp.dx, ppp.dy]
                    }, 200 * is_label_visible);
                lx = label[0].transform()[0][1] + ppp.dx;
                ly = label[0].transform()[0][2] + ppp.dy;
                frame.show().stop().animate(anim);
                label[0].attr({text: data + " hit" + (data == 1 ? "" : "s")}).show().stop().animateWith(frame, anim, {transform: ["t", lx, ly]}, 200 * is_label_visible);
                label[1].attr({text: lbl + " September 2008"}).show().stop().animateWith(frame, anim, {transform: ["t", lx, ly]}, 200 * is_label_visible);
                dot.attr("r", 6);
                is_label_visible = true;
            }, function () {
                dot.attr("r", 4);
                leave_timer = setTimeout(function () {
                    frame.hide();
                    label[0].hide();
                    label[1].hide();
                    is_label_visible = false;
                }, 1);
            });
        })(x, y, data[i], labels[i], dot);
    }
    p = p.concat([x, y, x, y]);
    bgpp = bgpp.concat([x, y, x, y, "L", x, height - bottomgutter, "z"]);
    path.attr({path: p});
    bgp.attr({path: bgpp});
    frame.toFront();
    label[0].toFront();
    label[1].toFront();
    blanket.toFront();
};



