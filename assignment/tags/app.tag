<app>

  <br>
  <br>
  <hgroup>

<strong> <h1>My Course Worksheet</h1> </strong>
  </hgroup>

  <div class="wrap">
    <div class="items">
      <todoItem each = {i in todoItems}></todoItem>
    </div>

    <input type="text" onkeypress={typeWords} placeholder="Enter todo task" class="textInput">
    <br>
    <br>
    <button class="delete" onclick={delete}>Delete {todoItems.filter(cal).length} </button>
  </div>

  <script>
  var that = this;
    this.todoItems = [];

  
  		var database = firebase.database();
  		var todoRef = database.ref('todoItems');

  		todoRef.on('child_added', function(value) {

  			var data = value.val();
        var id= value.key;
  					data.id = id;

  			that.todoItems.push(data);
  			that.update();
  		});

  		todoRef.on('child_removed', function(value) {
  			var data = value.val();
  			var id = value.key;

  			var target;

  			for (let i = 0; i < that.todosItems.length; i++) {
  				if (that.todosItems[i].id === id) {
  					target = that.todosItems[i];
  					break;
  				}
  			}

  			var index = that.todoItems.indexOf(target);

  			that.todosData.splice(index, 1);

  			that.update();
  		});


  		this.typeWords = function(event){
  			var newTask = {};
        var words= event.target.value;
  			if (event.which === 13) {
  				newTask.name = words;
  				newTask.done = false;
          event.target.value= '';

  				var newID = todoRef.push().key;
  				todoRef.child(newID).set(newTask);

          this.delete= function(){
            var deleted = this.todoItems.filter( function(item){
              return (item.done === true)

            })
            deleted.forEach(function(item){
              var rfKey= item.id;
              todoRef. child(rfkey).remove();

            })
            this.cal= function(item){
              return (item.done=== true)


  </script>


  <style>

  hgroup {
  text-align: left;
  padding-left: 16px;
  border-left: 10px solid #00c8d7;
}
      button:focus {outline:0;}

      h2 {
        text-transform: uppercase;
        padding: 20px;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
      }

      .wrap {
        max-width: 300px;
        width: 60%;
        margin: 0 auto;
        margin-top: 10%;
        box-sizing: border-box;
      }
      .items {
        display: block;
      }

      .textInput {
        display: block;
        width: 100%;
        padding: 15px 28px;
        font-size: 18px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        border: 2px solid #ccc;
        border-radius: 8px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
      }

      .delete {
        margin: 10px;
        height: 30px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background: transparent;
        cursor: pointer;
        color: #222;
        transition: all .4s;
        padding: 20px 30px;
        line-height: 0px;
        font-size: 16px;
        text-transform: uppercase;
      }

      .delete:hover {
        background: #222;
        color: #fff;
      }
    </style>

</app>
