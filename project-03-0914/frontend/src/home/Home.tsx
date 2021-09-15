import React, {useEffect} from "react";
import Button from "@material-ui/core/Button";
import {Grid} from "@material-ui/core";
import {useDataServiceApi} from "./HomeAPI";
import SummaryCard from "../components/SummaryCard";

interface Todo {
    id: number,
    text: string
}

export default function Home() {
    const [ todos, setTodos ] = React.useState<Todo[]>([]);
    const [ getTodos ] = useDataServiceApi();

    useEffect(() => {
        getTodos()
            .then(response => {
                setTodos(response.data.tasks);
            })
            .catch(error => {
                console.log(error);
            })
    }, []);

    const todosList = () => {
        return todos.map((todo) =>
            <Grid item xs={4} key={todo.id}>
                <SummaryCard
                    header={`id: ${todo.id.toString()}`}
                    value={todo.text}
                />
            </Grid>
        )
    }

    return (
        <>
            <div>
                <Button
                    style={{ marginBottom: "20px", float: "right" }}
                    variant="contained"
                    color="primary"
                >
                    Refresh
                </Button>
            </div>
            <div>
                <Grid container spacing={3}>
                    {
                        todosList()
                    }
                </Grid>
            </div>
        </>
    )
}
