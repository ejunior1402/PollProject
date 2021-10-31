<template>
    <div class="container">
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
                    <button class="btn btn-primary">View</button>
                    <button class="btn btn-danger">Destroy</button>
                </td>

            </tr>

            </tbody>
        </table>
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
            options: []
        }
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
                console.log(response.data);
            }))
            .catch(function (error){
                console.log(error);
            })
        },
        loadOptions(){

        }
    }
}
</script>

<style scoped>

</style>
