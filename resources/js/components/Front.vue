<template>

        <div class="row">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>

            <tr v-for="poll in polls" v-bind:key="poll.poll_id">
                <th scope="row">{{poll.poll_id}}</th>
                <td>{{poll.poll_description}}</td>
                <td>
                    <button @click="loadView(poll.poll_id)" class="btn btn-primary">View</button>
                    <button @click="loadStats(poll.poll_id)"class="btn btn-secondary">Stats</button>
                    <button @click="removePoll(poll.poll_id)" class="btn btn-danger">Destroy</button>
                </td>
            </tr>
            </tbody>
            <tfoot>
                <button @click="loadForm" class="btn btn-primary">New Poll</button>

            </tfoot>
        </table>

            <!-- modal view aqui -->
            <div class="modal" tabindex="-1" id="dlgview">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">View Poll #{{poll.poll_id}}</h5>
                            <button  type="button" data-dismiss="modal" class="close"  aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Poll Id: {{poll.poll_id}}</p>
                            <p>Poll description: {{poll.poll_description}}</p>
                            <p>Options: <span v-if="Object(poll.options).length == 0">Não há opções cadastradas</span></p>
                            <ul>
                                <li v-for="option in poll.options" >{{option.option_description}}
                                    <button @click="vote(option.option_id, poll.poll_id)" class="btn btn-sm btn-primary">Vote</button>
                                </li>
                            </ul>

                        </div>
                        <div class="modal-footer">
                            <button  type="button" class="btn btn-secondary"  data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>

            <!-- MODAL FORM -->
            <div class="modal fade" id="dlgform" tabindex="-1" role="dialog" aria-labelledby="pollcreate" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="pollcreate">New Poll</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form v-on:submit.prevent="savepoll">
                                <div class="form-group">
                                    <label for="poll_description" class="col-form-label">Poll description:</label>
                                    <input v-model="form.poll_description" type="text" class="form-control" name="poll_description" id="poll_description" placeholder="Poll description here">
                                </div>
                                <div class="form-group">
                                    <label for="options" class="col-form-label">Options:</label>
                                    <button @click.prevent="addOption" class="btn btn-primary">Add Option
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                        </svg>
                                    </button>
                                    <div id="options" v-for="(option, index) in form.options">
                                        <label>Option:</label>
                                        <input v-model="option.value"  placeholder="Type option here"/>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button  type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!-- modal STATS aqui -->
            <div class="modal" tabindex="-1" id="dlgstats">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Stats Poll #{{stats.poll_id}}</h5>
                            <button data-dismiss="modal" type="button" class="close" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Poll description: {{stats.poll_description}}</p>
                            <p>Views Poll : {{stats.views}}</p>
                            <p>Votes: <span v-if="Object(stats.votes).length == 0">There are not options</span></p>
                            <ul v-if="Object(stats.votes).length != 0">
                                <li v-for="option in stats.votes" >{{option.option_description}} : {{option.qty}} votes</li>
                            </ul>

                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal"  type="button" class="btn btn-secondary"  data-bs-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>

</template>

<script>

export default {

    id: 'front-page',
    name: "front-page",

    data: function() {
        return {
            polls: [],

            poll: [],
            stats: [],
            op:[],
            form: {
                poll_description: '',
                options: [],

            }

        };
    },
    mounted() {
        this.loadPolls();
    },

    methods:{
        loadForm(){
            this.form.poll_description = "";
            this.form.options = [];
            $('#dlgform').modal('show');
            this.addOption();
        },
        loadPolls(){
            //load api
            //assign this.polls
            //catch erros
            axios.get('/api/poll')
            .then((response => {
                this.polls = response.data;
                //console.log(response.data);
            }))
            .catch(function (error){
                console.log(error);
            })
        },
        vote(idOp, idPoll){
            axios.post('/api/poll/'+idOp+'/vote')
                .then((response => {
                    alert("voted")
                    this.loadView(idPoll);

                    //$('#dlgview').modal('show');
                }))
                .catch(function (error){
                    console.log(error);
                })
        },

        loadView(id){
            axios.get('/api/poll/'+id)
                .then((response => {
                    this.poll = response.data;
                    console.log(response.data);
                    $('#dlgview').modal('show');
                }))
                .catch(function (error){
                    console.log(error);
                })
        },
        removePoll(id){
            axios.delete('/api/poll/'+id)
                .then((response => {
                    var resp = response.data;
                    console.log(response.data);
                    alert("Poll removed");
                    this.loadPolls();
                }))
                .catch(function (error){
                    console.log(error);
                })
        },
        savepoll(){

            console.log(this.form);
            axios.post('/api/poll', this.form)
                .then((res) => {

                })
                .catch((error) => {
                    // error.response.status Check status code
                    alert(error);
                }).finally(() => {
                //Perform action in always
                $('#dlgform').modal('hide');
                this.loadPolls();
            });
        },
        loadStats(id){
            axios.get('/api/poll/'+id+'/stats')
                .then((response => {
                    this.stats = response.data;
                    console.log(response.data);
                    $('#dlgstats').modal('show');
                }))
                .catch(function (error){
                    console.log(error);
                })
        },
        addOption(){
            this.form.options.push({value: ''});
            //$('#options').append('<br><label>Option: </label><input type="text"  name="options[]"    />');
        }

    }
}
</script>

