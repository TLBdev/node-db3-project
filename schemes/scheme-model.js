const db = require('../data/db-config.js')
module.exports = {
    find,
    findById,
    findSteps,
    update,
    add,
    remove
}

function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes').where("id", id)
}

function findSteps(id) {
    return db('steps')
        .join('schemes', 'schemes.id', 'steps.scheme_id')
        .where("steps.scheme_id", id)
        .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
        .orderBy('step_number')
}

function add(newScheme, id) {
    return db('schemes').insert(newScheme).where("id", id)
}

function update(changes, id) {
    return db('schemes').update(changes).where("id", id)
}

function remove(id) {
    return db('schemes').where("id", id).del()
}