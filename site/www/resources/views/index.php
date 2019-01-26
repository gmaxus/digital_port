<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Todo List</title>

        <style type="text/css">
            .hight{ background-color: lightcoral}
            .normal{ background-color: lightgreen}
            .minimal{ background-color: lightgrey}
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"
    </head>
    <body>
        <main id="app">
            <div class="container">
                <header>
                    <main role="main" class="flex-shrink-0">
                        <h3 class="mt-5">Todo list</h3>
                    </main>
                    <div class="py-5 text-center">
                        <img class="d-block mx-auto mb-4" src="images/image.png" alt="" width="72" height="72">
                        <h2>{{ title }}</h2>
                    </div>
                </header>

                <div class="py-3">
                    <button class="btn btn-link" @click="loadAll">Все задачи</button>
                    <button class="btn btn-link" @click="loadActual">Актуальные</button>
                    <button class="btn btn-link" @click="loadDone">Завершённе</button>
                    <button class="float-right btn btn-primary"@click="modal=!modal">Добавить</button>
                </div>

                <div v-if="modal" id="modal">
                    <div class="form-group">
                        <form class="py-2" @submit.prevent="addTodo">
                                <center>
                                <input v-model="done" type="checkbox" name="done" id="state"></input>
                                <select  v-model="priority" id="priority">
                                    <option value="null">Выберите приоритет</option>
                                    <option value="2">Высокий</option>
                                    <option value="1">Средний</option>
                                    <option value="0">Низкий</option>
                                </select>
                                <button class="btn btn-primary" type="submit" name="button">Сохранить</button>
                                <button class="btn btn-outline-primary" @click="modal=!modal">Отменить</button>
                                <textarea rows="7" cols="50" v-model="name" type="text" name="name" id="name"></textarea>
                                </center>
                        </form>
                    </div>
                </div>

                <ul class="list-unstyled">
                    <li class="py-1 my-1 rounded" :class="{ hight: todo.priority == 2, normal: todo.priority == 1, minimal: todo.priority == 0 }" v-for="todo in todos">
                        <input @click="checkboxClick(todo)" type="checkbox" v-model="todo.done">
                        <span >{{ todo.name }}</span>
                        <span class="float-right badge badge-secondary btn" @click="editTodo(todo)">Редактировать</span>
<!--                        <button class="btn btn-secondary" >Редактировать</button>-->
                    </li>
                </ul>

                <div class="py-3">
                    <center>
                        <button v-if="more" class="btn btn-secondary" @click="loadMore">Ещё</button>
                    </center>
                </div>
            </div>


<!--            <footer>-->
<!--                <center><p>-->
<!--                    {{ title }} (c) 2019-->
<!--                </p></center>-->
<!--            </footer>-->
        </main>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="scripts/script.js"></script>

<!--    <script src="https://cdn.jsdelivr.net/npm/vue"></script>-->

    </body>
</html>