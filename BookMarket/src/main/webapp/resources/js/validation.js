function checkAddBook(){
    var bookId = document.getElementById("bookId");
    var name = document.getElementById("name");
    var unitPrice = document.getElementById("unitPrice");
    var unitsInStock = document.getElementById("unitsInStock");
    
    if(!check(/^ISBN[0-9]{4,11}$/,bookId,
    "[도서 코드]\n와 숫자를 조합하여 5~12자까지 입력하세요.\n 첫 글자는 반드시 ISBN로 시작하세요.")){
        return false;
    }
    if(name.value.length <4 || name.value.length>25){
        alert("[도서명]\n최소 4자에서 최대 25자까지 입력하세요.");
        name.select();
        name.focus();
        return false;
    }
    if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
        alert("[가격]\n 0이 아닌 숫자만 입력하세요.");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }
    
    if(unitPrice.value<=0){
        alert("[가격]\n 0이나 음수는 입력할 수 없습니다.");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }
    
    if(isNaN(unitsInStock.value)){
        alert("[재고수]\n숫자만 입력하세요.");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }
    
    function check(regExp, e, msg){
        if(regExp.test(e.value)){
            return true;
        }
        alert(msg);
        e.select();
        e.focus();
        return false;
    }
    document.newBook.submit();
}