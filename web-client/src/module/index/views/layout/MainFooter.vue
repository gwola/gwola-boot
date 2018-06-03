<template>
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> {{ setting.appVersion }}
    </div>
    <strong>Copyright &copy; 2006-2018 <a href="https://github.com/sunyu1984">GoodFox</a>.</strong> All rights reserved.
  </footer>
</template>

<script>
export default {
  computed: {
    setting: function () {
      return this.$store.state.system.settings
    }
  }
}
</script>
