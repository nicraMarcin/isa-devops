import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import {
    Box,
    Card,
    CardContent,
    Typography
} from "@material-ui/core";

interface Props{
    header: string,
    value: string
}

const useStyles = makeStyles({
    headerStyle: {
        color: "#5e5757",
        letterSpacing: ".1rem"
    },
    valueStyle: {
        color: "#b81812",
        letterSpacing: ".2rem"
    }
});

export default function SummaryCard(props: Props) {
    const classes = useStyles();

    return (
        <Card>
            <CardContent>
                <Typography variant="h6" className={classes.headerStyle}>
                    {props.header}
                </Typography>
                <Box
                    display="flex"
                    justifyContent="center"
                    alignItems="center"
                    minHeight="100px"
                >
                    <Typography variant="h5" align="center" className={classes.valueStyle}>
                        <b>{props.value}</b>
                    </Typography>
                </Box>
            </CardContent>
        </Card>
    )
}