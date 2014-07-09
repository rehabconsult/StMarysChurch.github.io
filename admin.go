package onechurch

import (
    "fmt"
    "net/http"
    "appengine"
    "appengine/user"
)

func init() {
    http.HandleFunc("/admin", admin)
}

func admin(w http.ResponseWriter, r *http.Request) {
	c := appengine.NewContext(r)
    u := user.Current(c)
    if u == nil {
        url, err := user.LoginURL(c, r.URL.String())
        if err != nil {
            http.Error(w, err.Error(), http.StatusInternalServerError)
            return
        }
        w.Header().Set("Location", url)
        w.WriteHeader(http.StatusFound)
        return
    } else if u.Email != "roneythomas6@gmail.com" {
    	fmt.Fprintf(w, "Not Authorized User")
    } else {
    	http.ServeFile(w, r, "app/admin.html")
    }
}
