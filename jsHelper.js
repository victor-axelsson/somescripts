console.dump = function() {
    var obj = {};
    for (var i = 0; i < arguments.length; i++) {
        obj[i] = arguments[i];
    }
    console.log(obj);
};

Array.prototype.unique = function(key) {
    var tmp = [];
    var cache = {};

    for (var i = 0; i < this.length; i++) {
        if (typeof cache[this[i][key]] == "undefined") {
            tmp.push(this[i]);
            cache[this[i][key]] = this[i][key];
        }
    }

    return tmp;
}


/**
 *  Helper method for checking if string contains another
 *  @author Victor Axelsson
 */
String.prototype.contains = function(it) {
    return this.indexOf(it) != -1;
};

/**
 *  Helper method for generating a random string of given length
 *  @author Victor Axelsson
 */
String.prototype.rand = function(len) {
    Math.random().toString(36).substr(2, len);
};


/**
 *  Reverses the string. Might have problems with special characters
 *  @author Victor Axelsson
 */
String.prototype.reverse = function() {
    return this.split("").reverse().join("");
}

/**
 *  Helper method for converting a JavaScript Date to a format MySql understands
 *  @author Victor Axelsson
 */
Date.prototype.toMysqlFormat = function() {
    return this.getUTCFullYear() + "-" + twoDigits(1 + this.getUTCMonth()) + "-" + twoDigits(this.getUTCDate()) + " " + twoDigits(this.getUTCHours()) + ":" + twoDigits(this.getUTCMinutes()) + ":" + twoDigits(this.getUTCSeconds());
};

/**
 *  Returns the millis in time readable format 
 *  @author Victor Axelsson
 */
Date.prototype.toTime = function() {
    /*
    var s = this.getTime();

    function addZ(n) {
        return (n < 10 ? '0' : '') + n;
    }
    var ms = s % 1000;
    s = (s - ms) / 1000;
    var secs = s % 60;
    s = (s - secs) / 60;
    var mins = s % 60;
    var hrs = (s - mins) / 60;

    return addZ(hrs) + ':' + addZ(mins) + ':' + addZ(secs) + '.' + ms;
    */
    return this.toTimeString();
}

Date.prototype.toDate = function() {
    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString(); // getMonth() is zero-based
    var dd = this.getDate().toString();
    return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]); // padding
};



Date.prototype.toDateTime = function() {
    var year = this.getFullYear(),
        month = this.getMonth() + 1, // months are zero indexed
        day = this.getDate(),
        hour = this.getHours(),
        minute = this.getMinutes(),
        second = this.getSeconds(),
        minuteFormatted = minute < 10 ? "0" + minute : minute,
        morning = hour < 12 ? "am" : "pm",
        hourFormatted = hour < 10 ? "0" + hour : hour;

    return year + "-" + month + "-" + day + " " + hourFormatted + ":" +
        minuteFormatted;
};

/**
 *  Helper method for formatting hours and minutes to 00 format. Used by Date.prototype.toMysqlFormat
 *  @author Victor Axelsson
 */
function twoDigits(d) {
    if (0 <= d && d < 10) return "0" + d.toString();
    if (-10 < d && d < 0) return "-0" + (-1 * d).toString();
    return d.toString();
}
