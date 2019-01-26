var app = new Vue({
    el: '#app',
    data: {
        title: 'Название приложения',
        id: null,
        done: false,
        name: '',
        priority: null,
        modal: false,
        filter: 'all',
        todos: [],
        editingTodo: null,
        more: true,
    },
    created() {
        axios.get('/api')
            .then( response => {
                if(response.status == 200){
                    response.data.message.forEach((element) => {
                        this.todos.push({
                            id: element.id,
                            name: element.name,
                            done: element.done,
                            priority: element.priority,
                            created_at: element.created_at
                        });
                    });
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    },
    methods: {
        addTodo() {
            if (this.priority !== null) {

                if(this.id === null){

                    axios.post('/api/create', {
                        name: this.name,
                        priority: this.priority,
                        done: this.done
                    })
                        .then((response) => {
                            if (response.data.status == 400)
                            {
                                console.log(response.data.message)
                            }
                            if (response.data.status == 500)
                            {
                                console.log(response.data.message)
                            }
                            if (response.data.status == 200) {
                                this.todos.unshift({
                                    id: response.data.message[0].id,
                                    name: response.data.message[0].name,
                                    done: response.data.message[0].done,
                                    priority: response.data.message[0].priority,
                                });
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                }else{
                    axios.put('/api/edit/'+this.id, {
                        name: this.name,
                        priority: this.priority,
                        done: this.done
                    })
                    editingTodo.done = this.done;
                    editingTodo.priority = this.priority;
                    editingTodo.name = this.name;
                }

                this.editingTodo = null;
                this.name = '';
                this.priority = null;
                this.done = 0;
                this.id = null;
                this.modal = false;
            }

        },
        loadMore() {

            var lastPosition = this.todos.length-1;
            var last_id = this.todos[lastPosition].id;

            var get_string = '';
            if (this.filter === 'all')
                get_string = '/api/' + last_id;
            else
                get_string = '/api/' + this.filter + '/' + last_id;

            axios.get(get_string)
                .then(response => {
                    if (response.data.status === 404)
                        this.more=false;

                    if (response.data.status === 200) {
                        response.data.message.forEach((element) => {
                            this.todos.push({
                                id: element.id,
                                name: element.name,
                                done: element.done,
                                priority: element.priority,
                                created_at: element.created_at
                            });
                        });
                    }

                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        loadAll() {
            this.more=true;
            this.filter = 'all';
            this.todos = [];
            axios.get('/api')
                .then(response => {
                    if (response.data.status === 404) {
                        this.more=false;
                    }
                    if (response.data.status === 200) {
                        response.data.message.forEach((element) => {
                            this.todos.push({
                                id: element.id,
                                name: element.name,
                                done: element.done,
                                priority: element.priority,
                                created_at: element.created_at
                            });
                        });
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        loadDone() {
            this.more=true;
            this.filter = 'done';
            this.todos = [];
            axios.get('/api/done')
                .then(response => {
                    if (response.data.status === 404) {
                        this.more=false;
                    }
                    if (response.data.status === 200) {
                        response.data.message.forEach((element) => {
                            this.todos.push({
                                id: element.id,
                                name: element.name,
                                done: element.done,
                                priority: element.priority
                            });
                        });
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        loadActual() {
            this.more=true;
            this.filter = 'actual';
            this.todos = [];
            axios.get('/api/actual')
                .then(response => {

                    if (response.data.status === 404) {
                        this.more=false;
                    }
                    if (response.data.status === 200) {
                        response.data.message.forEach((element) => {
                            this.todos.push({
                                id: element.id,
                                name: element.name,
                                done: element.done,
                                priority: element.priority
                            });
                        });
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        checkboxClick(todo) {

            if(this.filter === 'done' && todo.done !== 'done')
            {
                const todoindex = this.todos.indexOf(todo);
                this.todos.splice(todoindex, 1)
            }

            if(this.filter === 'actual' && todo.done === 0)
            {
                const todoindex = this.todos.indexOf(todo);
                this.todos.splice(todoindex, 1)
            }

            if(this.todos.length === 0)
                this.more=false;

            axios.put('/api/edit/' + todo.id, {
                done: !todo.done
            })
                .then(response => {
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        editTodo(todo) {
            this.modal = true;
            editingTodo = todo;

            this.id = todo.id;
            this.done = todo.done;
            this.name = todo.name;
            this.priority = todo.priority;

        }
    }

});