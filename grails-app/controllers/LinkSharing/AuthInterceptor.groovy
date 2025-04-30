package linksharing

class AuthInterceptor {

      AuthInterceptor() {
            matchAll()
                    .excludes(controller: 'webSurf', action: 'login')
                        // Excludes both '/' and '/webSurf/login'
      }

      boolean before() {
            if (!session.user) {
                  redirect(controller: 'webSurf', action: 'login')
                  return false
            }
            return true
      }

      boolean after() { true }

      void afterView() {
            // no-op
      }
}
