// Use this file to write queries to test your data connector
let
    result = pbiAdminAPI.Navigation(),
    ActivityAdmin = result{[Key="ActivityAdmin"]}[Data],
    callen = ActivityAdmin{[Key="ExternalApplicationConnectedBy30Days"]}[Data]
in
    callen
