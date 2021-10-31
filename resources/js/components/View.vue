<template>
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
                    <p>Options: </p>


                    <ul>
                        {{poll.options}}
                    </ul>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

</template>

<script>
export default {
    id: "view-component",
    name: "View.vue",

    data:{

    },
    methods:{

    },
    mounted() {

    }


}
</script>

<style scoped>

</style>
