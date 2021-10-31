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
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>

            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>

            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry the Bird</td>
                <td>@twitter</td>
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
    mounted() {
        console.log('Component mounted.')
    }
}
</script>

<style scoped>

</style>
