const db = require("../data/config")

function find(){
    return db("schemes")
}

function findById(id){
    return db("schemes").where("id", id).first()
}

function findSteps(id){
    return db("steps as s")
        .join("schemes as sc", "s.scheme_id", "sc.id")
        .where("sc.id", id)
        .select("s.id", "sc.scheme_name", "s.step_number", "s.instructions")
}

async function add(scheme){
    try{
       const [id] = await db("schemes").insert(scheme)
       return db("schemes").where("id", id).first()

    } catch(err){
        return err
    }
    

}

async function update(changes, id){
    try{
        await db("schemes").where("id", id).update(changes)
        return db("schemes").where("id", id).first()
    }catch(err){
        return err
    }
}

async function remove(id){
    try{
        const [deleted] = await db("schemes").where("id", id)
        await db("schemes").where("id", id).del()
        return deleted
    }catch(err){
        return err
    }
    
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
}