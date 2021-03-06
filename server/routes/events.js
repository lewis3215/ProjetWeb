const express = require("express");

function eventRouter(pgClient) {
    const router = express.Router();

    router.get("/", async (req, res) => {
        const result = await pgClient.query({
            text: 'SELECT * FROM events ',
        });
        if (result.rows == null)
            res.status(404).send("Not found");
        else
            res.status(200).json(result.rows);

        return;

    });

    router.post("/", async (req, res) => {
        const body = req.body;
        
        const result = await pgClient.query({
            text: "INSERT INTO events(title,description,image,available_seats,localisation,date, offer) VALUES($1,$2,$3,$4,$5,$6,$7)",
            values: [body.title, body.description, body.image, body.available_seats, body.localisation,body.date, body.offer]
        });
        res.status(200).send("Added");

        /*DATE AVEC POSTGRES */


        
        return;
    });

    router.put("/:id", async (req, res) => {
        const body = req.body;
        let query = "UPDATE events SET";
        console.log(typeof body.date);
        let tmp = false;/*Cette variable est utilisee pour ecrire une requete UPDATE dynamiquement en fonction des parametres en entreee*/
        for (let attr in body) {
            if (tmp) {
                query += ",";
                tmp = true;
            }
            query += ` ${attr} = '${body[attr]}' `;
            tmp=true;

        }
        query += " WHERE id = " + req.params.id;
        try {
            const result = await pgClient.query({
                text: query
            });
            res.status(200).send("OK");
        } catch (error) {
            console.log("/*----------------------------------------------------------*/")
            console.log(query);
            console.log("/*----------------------------------------------------------*/")
            res.status(400).send("Requete invalide");
            throw error;
        }
        return;

    });

    router.delete("/:id", async (req, res) => {

        const result = await pgClient.query({
            text: " DELETE FROM events WHERE id=$1",
            values: [req.params.id]
        });

        res.status(200).send("Deleted");
        return;
    });

    return router;

}


module.exports = eventRouter;