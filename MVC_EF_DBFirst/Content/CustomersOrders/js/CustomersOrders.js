$(document).ready(function () {
    

});

function onEdit(CustomerID){
    //alert(CustomerID + " Edited");
    //var Url = '/Customer/EditCustomer';
    //$.ajax({
    //    url: Url,
    //    type: 'GET',
    //    datatype: 'json',
    //    success: function (result) {

    //    }
        
    //});
    window.location.href = '/Customer/EditCustomer?id=' + CustomerID;
}


function onDelete(CustomerID) {
    alert(CustomerID + " Deleted");

}

