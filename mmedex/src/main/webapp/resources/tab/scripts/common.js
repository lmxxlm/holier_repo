$(function(){
    $('input[name="selectAll"]').change(function(){
	    selectAll(this);
	});
})
function selectAll(obj){
	$(obj).attr('checked')?$('.selectall_unit').attr('checked',true):$('.selectall_unit').attr('checked',false); 
}