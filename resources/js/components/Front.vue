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
                    <button class="btn btn-danger">Destroy</button>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <button class="btn btn-primary">New Poll</button>
            </tfoot>
        </table>

            <!-- modal view aqui -->
            <div class="modal" tabindex="-1" id="dlgview">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">View Poll #{{poll.poll_id}}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Poll Id: {{poll.poll_id}}</p>
                            <p>Poll description: {{poll.poll_description}}</p>
                            <p>Options: <span v-if="Object(poll.options).length == 0">Não há opções cadastradas</span></p>
                            <ul>
                                <li v-for="option in poll.options" >{{option.option_description}}</li>
                            </ul>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

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
            options: [],
            poll: [],

        };
    },
    mounted() {
        this.loadPolls();
        this.loadOptions();

    },
    methods:{
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
        loadOptions(){

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

    }
}
</script>

