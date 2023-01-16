# import csv
import pandas as pd
import psycopg2
from sqlalchemy import create_engine


class DbConnect:
    def __init__(
        self, host: str, port: int, db_name: str, user: str, password: str
    ) -> None:
        self.host = host
        self.port = port
        self.db_name = db_name
        self.user = user
        self.password = password

    def db_connection(self):
        """Creates a database connection"""
        engine = create_engine(
            f"postgresql+psycopg2://{self.user}:{self.password}@{self.host}:{self.port}/{self.db_name}"
        )
        return engine.connect()

    def query(self, query_string: str):
        """Queries the database with the given query_string"""
        with self.db_connection() as conn:
            return pd.read_sql_query(query_string, conn)
