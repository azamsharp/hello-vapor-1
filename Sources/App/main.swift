import Vapor
import VaporSQLite

let drop = Droplet()
try drop.addProvider(VaporSQLite.Provider.self)

drop.get("version") { request in
    let result = try drop.database?.driver.raw("SELECT sqlite_version()")
    return try JSON(node: result)
}

drop.run()
