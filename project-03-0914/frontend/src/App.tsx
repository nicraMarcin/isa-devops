import React, {useEffect} from 'react';
import {Route, Switch} from "react-router-dom";
import { makeStyles } from "@material-ui/core/styles";
import Snackbar from "@material-ui/core/Snackbar";
import MuiAlert from '@material-ui/lab/Alert';
import Home from "./home/Home";


const useStyles = makeStyles({
    root: {
        backgroundColor: "rgba(255, 255, 255, 0.7)",
        height: "100vh",
    },
    content: {
        margin: 30,
    },
});

function Alert(props: any) {
    return <MuiAlert elevation={6} variant="filled" {...props} />;
}

export default function App() {
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState('');
    const classes = useStyles();

    const handleClose = () => {
        setError('');
        setOpen(false);
    };

    useEffect(() => {

    }, []);

    return (
        <div>
            <div className={classes.root}>
                <Switch>
                    <Route path="/home">
                        <Home />
                    </Route>
                </Switch>
            </div>
            { (open || !!error) &&
            <Snackbar
                anchorOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                }}
                open={open || !!error}
                autoHideDuration={2000}
                onClose={handleClose}
            >
                <Alert onClose={handleClose} severity={error ? "error" : "success"}>
                    {!!error ? error : "Success!"}
                </Alert>
            </Snackbar>
            }
        </div>
    )
}
