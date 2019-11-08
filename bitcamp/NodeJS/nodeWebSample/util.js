// 외부에서 접근하기 위한

// setter
module.exports.setConn = function(conn) {
    // conn에다가 외부에서 들어오는 conn을 넣어라
    this.conn = conn;
}

// getter
module.exports.getConn = function () {
    return this.conn;
}

